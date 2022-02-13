function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'test';
  }
    var config = {
    env: env,
    baseURL: 'https://3e3d2990-3fca-4144-8b26-1538cf135a09.mock.pstmn.io/users',
    roofStackData:'classpath:data/',
    configActivityPath:'activity',
    configHeaders: 'application/json; charset=utf-8'
  }
  if (env == 'regression') {
      config.baseURL= ''
      config.qanyonEnv = 'regression'
  } else if (env == 'live') {
     config.baseURL= ""
  }

   karate.configure('connectTimeout', 5000);
   karate.configure('readTimeout', 5000);
  return config;
}
