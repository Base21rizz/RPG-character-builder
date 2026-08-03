<h2>RPG Build Planner</h2>
Hi! This is the final project I built for my DBMS course. The goal was to create a desktop application that helps RPG players manage their character loadouts. Instead of just saving data to a local file, I built this using a relational database (MySQL) to ensure all the character, weapon, and artifact data stays perfectly organized and linked.

**Architecture
Frontend:** HTML5, CSS, and JavaScript.

**Backend:** Node.js and Express.js, which acts as the bridge between the app and the database.

**Desktop Wrapper:** Electron, which turns the web interface into a native desktop app.

**Database:** MySQL (Relational), using normalized tables and foreign keys to keep everything consistent.

<h3>How to run it</h3>
Since I’ve bundled the application for you, you don't need to mess with the code to play with it. Just follow these steps:

Step 1: Set up the Database
Make sure your MySQL server is running (if you're using XAMPP, just start Apache and MySQL). Open phpMyAdmin, create a new database named RPG, click Import, and upload the rpg.sql file from this folder. This will automatically create all the tables and fill them with the starter data.

Step 2: Run the App
Head over to the Releases tab on the right side of this GitHub page. Download the RPG-Builder-win32-x64.rar file. Extract it to a folder on your computer, open that folder, and double-click RPG-Builder.exe. The app will launch and automatically connect to your local MySQL database.

**Project Files**
index.html: The UI of the app. It handles the buttons and dropdowns, and talks to the backend whenever you save or delete a build.

main.js: The brains of the operation. It runs the Express server, connects to MySQL, and handles the Electron window.

rpg.sql: The database blueprint. It defines the tables, sets up the relations, and holds the default data.

Why is the file size so big?
You might notice the .rar file is a bit large (~220MB). That’s because I’ve bundled the app as a standalone executable using Electron, which includes its own browser engine so it runs smoothly on any machine without needing to install Node.js separately!

