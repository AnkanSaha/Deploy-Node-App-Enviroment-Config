module.exports = {
  apps : [{
    name   : "Video Downloader",
    script : "./Video-Downloader/downloader.js",
    instances : "max",
    exec_mode : "cluster",
    max_memory_restart: '200M',
    env: {
      NODE_ENV: "development",
    },
    env_production : {
      NODE_ENV: "production"
    }
  },
  {
    name   : "Portfolio",
    script : "./Portfolio/portfolio.js",
    instances : "max",
    exec_mode : "cluster",
    max_memory_restart: '900M',
    env: {
      NODE_ENV: "development",
    },
    env_production : {
      NODE_ENV: "production"
    }
  },
  {
    name   : "SaveNet",
    script : "./SaveNet/data.js",
    instances : "max",
    exec_mode : "cluster",
    max_memory_restart: '900M',
    env: {
      NODE_ENV: "development",
    },
    env_production : {
      NODE_ENV: "production"
    }
},
{
  name   : "Donation Tracker",
  script : "./Donation Tracker/donate.js",
  instances : "max",
  exec_mode : "cluster",
  max_memory_restart: '100M',
  env: {
    NODE_ENV: "development",
  },
  env_production : {
    NODE_ENV: "production"
  }
},
{
  name   : "University Result",
  script : "./University-Result/Result.js",
  instances : "max",
  exec_mode : "cluster",
  max_memory_restart: '600M',
  env: {
    NODE_ENV: "development",
  },
  env_production : {
    NODE_ENV: "production"
  }
}]
}
