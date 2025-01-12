const express = require('express')
const app = express();
const cluster = require('cluster');
const numCpus = require('os').cpus().length;
const compression = require('compression');

app.use(compression());
app.use(express.json({limit: '10mb'}));

const api = require("./api");

app.get('/api/hello', (req, res) => {
  console.log('requested');
  res.send({ response :'World!'})
})

app.post('/api/client/records', async (req, res, next) => {
  try {
    await api.postRecords(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.get('/api/client/records/:recordId', async (req, res, next) => {
  try {
    await api.getRecord(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.get('/api/client/record-views/tomeActive', async (req, res, next) => {
  try {
    await api.tomeActive(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.get('/api/client/record-views/allActive', async (req, res, next) => {
  try {
    await api.allActive(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.get('/api/client/record-views/allClosed', async (req, res, next) => {
  try {
    await api.allClosed(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.get('/api/client/record-views/mineActive', async (req, res, next) => {
  try {
    await api.mineActive(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.put('/api/client/records/:recordId', async (req, res, next) => {
  try {
    await api.updateRecord(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.get('/api/client/records/:recordId/comments', async (req, res, next) => {
  try {
    await api.getComments(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.post('/api/client/records/:recordId/comments', async (req, res, next) => {
  try {
    await api.postComments(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.get('/api/client/categories', async (req, res, next) => {
  try {
    await api.getCategories(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.post('/api/client/files', async (req, res, next) => {
  try {
    await api.postFiles(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.get('/api/client/records/:recordId/files/:itemId', async (req, res, next) => {
  try {
    await api.getRecordItemFile(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

app.get('/api/client/records/:recordId/files/:itemId/thumbnail', async (req, res, next) => {
  try {
    await api.getRecordItemFileThumbnail(req, res);
  } catch(e) {
    console.log(e);
    next(new Error("Unexpect"));
  }
})

cluster.schedulingPolicy = cluster.SCHED_NONE; // windowsの場合

if (cluster.isMaster) {
  console.log(`Master ${process.pid} is running`);

  for (let i = 0; i < numCpus; i++) {
    cluster.fork();
  }

  cluster.on('exit', (worker, code, signal) => {
    console.log(`worker ${worker.process.pid} was killed by signal: ${signal}`);
    cluster.fork();
  });
} else {
  app.listen(8000, () => console.log('listening on port 8000..'));
}
