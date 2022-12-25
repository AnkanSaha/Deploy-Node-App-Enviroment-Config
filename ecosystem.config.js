module.exports = {
  apps : [{
    name   : "Video Downloader",
    script : "./Video-Downloader/downloader.js",
    exec_mode : "fork",
    max_memory_restart: '200M',
    autorestart: true,
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
    exec_mode : "fork",
    max_memory_restart: '900M',
    autorestart: true,
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
    exec_mode : "fork",
    max_memory_restart: '900M',
    autorestart: true,
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
  exec_mode : "fork",
  max_memory_restart: '100M',
  autorestart: true,
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
  exec_mode : "fork",
  max_memory_restart: '600M',
  autorestart: true,
  env: {
    NODE_ENV: "development",
  },
  env_production : {
    NODE_ENV: "production"
  }
},
{
  name   : "Node Auto Update by Python",
  script : "./auto_Updater.py",
  exec_mode : "fork",
  max_memory_restart: '100M',
  autorestart: true,
  interpreter: "python",
  env: {
    NODE_ENV: "development",
  },
  env_production : {
    NODE_ENV: "production"
  }
}]
}
