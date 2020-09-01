// --- server.js ---
const feathers = require("feathers");
const serveStatic = require("feathers").static;
const rest = require("feathers-rest");
const socketio = require("feathers-socketio");
const hooks = require("feathers-hooks");
const bodyParser = require("body-parser");
const handler = require("feathers-errors/handler");
const multer = require("multer");
const multipartMiddleware = multer();
const dauria = require("dauria");

const blobService = require("feathers-blob");
const fs = require("fs-blob-store");
const blobStorage = fs(__dirname + "/uploads");

// Feathers app
const app = feathers();

// Serve our index page
app.use("/", serveStatic(__dirname));
// Parse HTTP JSON bodies
app.use(bodyParser.json({ limit: "10mb" }));
// Parse URL-encoded params
app.use(bodyParser.urlencoded({ limit: "10mb", extended: true }));
// Register hooks module
app.configure(hooks());
// Add REST API support
app.configure(rest());
// Configure Socket.io real-time APIs
app.configure(socketio());

// Upload Service with multipart support
app.use(
  "/uploads",

  // multer parses the file named 'uri'.
  // Without extra params the data is
  // temporarely kept in memory
  multipartMiddleware.single("uri"),

  // another middleware, this time to
  // transfer the received file to feathers
  function (req, res, next) {
    req.feathers.file = req.file;
    next();
  },
  blobService({ Model: blobStorage })
);

const handleUpload = (hook) => {
  if (!hook.data.uri && hook.params.file) {
    const file = hook.params.file;
    const uri = dauria.getBase64DataURI(file.buffer, file.mimetype);
    hook.data = { uri: uri };
    hook.data.id = hook.params.file.originalname;
  }
};

const validateXlsWeights = (hook) => {
  console.log("implement me");
};

app.service("/uploads").before({
  create: [handleUpload, validateXlsWeights],
});

// Register a nicer error handler than the default Express one
app.use(handler());

// Start the server
app.listen(3030, function () {
  console.log("Feathers app started at localhost:3030");
});
