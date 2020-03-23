console.log("Hello ! This is second APP JS file. !");

var faker = require("faker");
for (var i=0; i<=5 ; i++){
	console.log(faker.internet.email());
	 }

var mysql = require("mysql");
var connection = mysql.createConnection({
										host: 'localhost',
										user: 'root',
										database: 'join_us'
										});

// Insertion using the Node
var q = "INSERT INTO users(email, created_at) VALUES ('" + faker.internet.email() + "','" + faker.date.past() + "')";
connection.query(q, function(error,result){
										if(error) throw error;
										console.log(result);
										});

var person = {email: faker.internet.email(),
		created_at: faker.date.past()
		};
connection.query("INSERT INTO users SET?", person, function(error,results){
													if(error) throw error;
													console.log(results);
													}
				);

var data = [];
for(var i=0 ; i<444; i++){
	data.push([faker.internet.email(),faker.date.past()]);
}
connection.query("INSERT INTO users(email,created_at) VALUES ?", [data], function(error,results){
																				   if(error) throw error;
																					console.log(results);
																				   }
				);
q = "SELECT * FROM users";
connection.query(q, function(error,results){
					if(error) throw error;
					for(var i=0; i< results.length; i++){
						console.log("The user email is: " + results[i].email);
					}
					});

q = "SELECT COUNT(*) AS count FROM users";
connection.query(q, function(error,results){
					if(error) throw error;
					console.log("The total users are: " + results[0].count);
					});

connection.end();
