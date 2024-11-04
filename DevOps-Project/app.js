const express = require("express");
const app = express();
const PORT = process.env.PORT || 4200;

// Serve static files from the 'public' directory
app.use(express.static("public"));

// Define an array of teammates' names
const teammates = [
  "mohamed abdelfattah maghawry mostafa",
  "Kerols kamil waheeb",
  "mahmoud abdellatif basiony",
  "Mahmoud Mohamed Ali Shokry",
  "Mohamed Mohamed Abd El Kawy",
  "Marco Maged Fouad",
];

// Define the root route
app.get("/", (req, res) => {
  const teammatesList = teammates.map((name) => `<li>${name}</li>`).join("");

  res.send(`
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Hello Class App</title>
            <style>
                body { font-family: Arial, sans-serif; text-align: center; margin: 50px; }
                img { max-width: 100%; height: auto; }
                ul { list-style-type: none; padding: 0; }
                li { font-size: 1.2em; margin: 5px 0; }
            </style>
        </head>
        <body>
            <h1>Hello, Teammates!</h1>
            <img src="class-photo.jpg" alt="Class Photo">
            <h2>Teammates</h2>
            <ul>
                ${teammatesList}
            </ul>
        </body>
        </html>
    `);
});

// Only start the server if not in test mode
if (process.env.NODE_ENV !== 'test') {
  app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`);
  });
}

module.exports = app;
