const http = require('http');
const os = require('os');
const fs = require('fs');
const mariadb = require('mariadb');
const express = require('express')

console.log("Tiny http server starting. Mariadb supported.");
const dock_host = process.env.DOCK_HOST;

let mdb_host = process.env.MDB_HOST;
let mdb_user = process.env.MDB_USER;
let mdb_pass = process.env.MDB_PASS;
let mdb_dbas = process.env.MDB_dbas;

if(typeof mdb_host === 'undefined' || mdb_host === null || mdb_host === "")  mdb_host="mariadb";
if(typeof mdb_user === 'undefined' || mdb_user === null || mdb_user === "") mdb_user="root";
if(typeof mdb_pass === 'undefined' || mdb_pass === null ) mdb_pass="pass";
if(typeof mdb_dbas === 'undefined' || mdb_dbas === null || mdb_dbas === "" ) mdb_dbas="library";


const pool = mariadb.createPool({
  host: mdb_host, 
  user: mdb_user, 
  password: mdb_pass,
  database: mdb_dbas
});

const getConnection = function(){
      return new Promise(function(resolve,reject){
        pool.getConnection().then(function(connection){
          resolve(connection);
        }).catch(function(error){
          reject(error);
        });
      });
};

let data_dir  = process.env.LOG_DIR;

const dir= '/var/log/web_log';

if(typeof data_dir === 'undefined' || data_dir === null || data_dir === '' ) data_dir = dir;
data_dir = data_dir;

if (!fs.existsSync(data_dir)) fs.mkdirSync(data_dir, { recursive: true });

const handler = function(request, response) {

  const addr = request.connection.remoteAddress;	
  const dt = new Date();
 	
  response.writeHead(200);

  const host_name =  os.hostname();
  const host_ip = request.connection.localAddress;	
  console.log(dt +  "--> request from: " + addr + " to host: " +host_name);

  const content = `${dock_host}: ${dt} --> request from: ${addr} to host: ${host_name}.\n`	

  fs.writeFile(`${data_dir}/wapp.log`, content, { flag: 'a+' }, err => 
	  {  if(err) { console.error(err); return; }  
		  console.log(`++ success write to ${data_dir}/wapp.log`) 

	  })

	const body = 
  `<html>
     <head>
       <title>Library Site!!: ${host_name} </title>
     </head>
     <body>
     <h1>How do you do!! Welcome to Library host: [${dock_host}]</h1>
     <h2>Container id: ${host_name}</h2>
     <h2>Container ip: ${host_ip}</h2>
     <div style="color:green;">
       	<h3>Accessed from: ${addr} </h3>
     	<h3>${dt}</h3>
     </div>
     <h3>
     <a href="/api/books">/api/books: get book list</a>
     </h3>
     </body>
     </html>`;

  response.end(body);
};


const app = express();
app.get('/api/books', async (req, res) => {
    let conn;
    try {
      
        conn = await pool.getConnection();
        const query = "select * from books";
        let rows = await conn.query(query);
        res.send(rows);

    } 
	catch (err) {   throw err;   } 
	finally {
        if (conn) return conn.release();
    }
});

app.get('/', handler);
app.listen(8080);
