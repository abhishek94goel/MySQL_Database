var faker = require("faker");

var mysql = require("mysql");
var connection = mysql.createConnection({
										host: 'localhost',
										user: 'root',
										database: 'join_us'
										});

var data = [];
for(var i=0 ; i<44; i++){
	data.push([faker.internet.email(),faker.date.past()]);
}
connection.query("INSERT INTO users(email,created_at) VALUES ?", [data], function(error,results){
																					console.log(results);
																				   }
				);

q = "SELECT COUNT(*) AS count FROM users";
connection.query(q, function(error,results){
					console.log("The total users are: " + results[0].count);
					});

connection.end();
