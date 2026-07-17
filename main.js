const { app, BrowserWindow } = require('electron');
const express = require('express');
const mysql = require('mysql2');
const path = require('path');

const expressApp = express();
expressApp.use(express.json());
expressApp.use(express.static(__dirname));

const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'RPG',
    waitForConnections: true,
    connectionLimit: 10
});

// 1. READ ALL BUILDS (Uses 7-Table JOIN for strict relational integrity)
expressApp.get('/api/builds', (req, res) => {
    const sql = `
        SELECT 
            pb.BuildID, pb.CharLevel, pb.WeaponLevel, 
            pb.Flower, pb.Plume, pb.Sands, pb.Goblet, pb.Circlet,
            c.CharID, c.Name AS CharName, c.Role, c.Img_URL AS CharImg,
            w.WeaponID, w.Name AS WeaponName, w.Weapon_Type, w.Img_URL AS WeaponImg,
            af.Name AS FlowerName, ap.Name AS PlumeName, asa.Name AS SandsName, 
            ag.Name AS GobletName, ac.Name AS CircletName
        FROM Player_Builds pb
        JOIN Characters c ON pb.CharID = c.CharID
        JOIN Weapons w ON pb.WeaponID = w.WeaponID
        LEFT JOIN Artifact_Sets af ON pb.Flower = af.ArtID
        LEFT JOIN Artifact_Sets ap ON pb.Plume = ap.ArtID
        LEFT JOIN Artifact_Sets asa ON pb.Sands = asa.ArtID
        LEFT JOIN Artifact_Sets ag ON pb.Goblet = ag.ArtID
        LEFT JOIN Artifact_Sets ac ON pb.Circlet = ac.ArtID
        ORDER BY pb.BuildID DESC
    `;
    
    db.query(sql, (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        
        // Map the flattened SQL JOIN row back into the nested object the UI dropdowns expect
        const mappedData = results.map(row => ({
            id: row.BuildID.toString(),
            characterId: row.CharID.toString(),
            characterName: row.CharName,
            characterRole: row.Role,
            characterImg: row.CharImg,
            weaponId: row.WeaponID.toString(),
            weaponName: row.WeaponName,
            weaponType: row.Weapon_Type,
            weaponImg: row.WeaponImg,
            charLevel: row.CharLevel,
            weaponLevel: row.WeaponLevel,
            artifacts: {
                flower: row.Flower, 
                plume: row.Plume, 
                sands: row.Sands, 
                goblet: row.Goblet, 
                circlet: row.Circlet
            }
        }));
        res.json(mappedData);
    });
});

// 2. CREATE BUILD
expressApp.post('/api/builds', (req, res) => {
    const { characterId, weaponId, charLevel, weaponLevel, artifacts } = req.body;
    const { flower, plume, sands, goblet, circlet } = artifacts || {};

    const sql = `INSERT INTO Player_Builds (CharID, WeaponID, CharLevel, WeaponLevel, Flower, Plume, Sands, Goblet, Circlet) 
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;
                 
    db.query(sql, [characterId, weaponId, charLevel, weaponLevel, flower, plume, sands, goblet, circlet], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(201).json({ id: result.insertId.toString(), ...req.body });
    });
});

// 3. UPDATE BUILD
expressApp.put('/api/builds/:id', (req, res) => {
    const { characterId, weaponId, charLevel, weaponLevel, artifacts } = req.body;
    const { flower, plume, sands, goblet, circlet } = artifacts || {};

    const sql = `UPDATE Player_Builds SET CharID=?, WeaponID=?, CharLevel=?, WeaponLevel=?, Flower=?, Plume=?, Sands=?, Goblet=?, Circlet=? WHERE BuildID=?`;
                 
    db.query(sql, [characterId, weaponId, charLevel, weaponLevel, flower, plume, sands, goblet, circlet, req.params.id], (err) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json({ id: req.params.id, ...req.body });
    });
});

// 4. DELETE BUILD
expressApp.delete('/api/builds/:id', (req, res) => {
    db.query('DELETE FROM Player_Builds WHERE BuildID = ?', [req.params.id], (err) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(204).send();
    });
});

expressApp.listen(3000, () => console.log('DB Bridge active on port 3000'));

// ELECTRON CONFIG
app.whenReady().then(() => {
    const win = new BrowserWindow({
        width: 1180, height: 880, autoHideMenuBar: true,
        webPreferences: { nodeIntegration: false, contextIsolation: true }
    });
    win.loadURL('http://localhost:3000');
});

app.on('window-all-closed', () => { if (process.platform !== 'darwin') app.quit(); });