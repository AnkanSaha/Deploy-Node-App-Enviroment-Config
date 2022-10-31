module.exports = {
  apps : [{
    name   : "AllSave",
    script : "./Video-Downloader/downloader.js",
    watch: true,
    env_production : {
      "NODE_ENV": "production"
    }
  },
  {
    name   : "SaveNet",
    script : "./SaveNet/data.js",
    watch: true,
    env_production : {
      "NODE_ENV": "production"
    }
  },
  {
    name   : "Portfolio",
    script : "./Portfolio/app.js",
    watch: true,
    env_production : {
      "NODE_ENV": "production"
    }
  },
  {
    name   : "University Result",
    script : "./University-Result/Result.js",
    watch: true,
    env_production : {
      "NODE_ENV": "production"
    }
  }
  ]
}
