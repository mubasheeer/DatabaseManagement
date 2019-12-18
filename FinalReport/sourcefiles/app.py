
from flask import Flask, redirect, url_for,  render_template, request
# from flask_mysqldb import MySQL
from flaskext.mysql import MySQL
# import yaml


app = Flask(__name__)

#to connect db
# database = yaml.full_load(open('database.yaml'))
# app.config['MYSQL_HOST'] = database['mysql_host']
# app.config['MYSQL_USER'] = database['mysql_user']
# app.config['MySQL_PASSWORD'] = database['mysql_password']
# app.config['MYSQL_DB'] = database['mysql_db']

# mysql = MySQL(app)
mysql = MySQL()
 
# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'mypass'
app.config['MYSQL_DATABASE_DB'] = 'bond'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route('/')
def hello(): 
	return '<h1>main page</h1>'
@app.route('/home/<username>')
def name(username):
	return 'home page of '+str(username)

@app.route('/home/user/admin')
def admin():
	return 'Hello admin'
@app.route('/home/user/<userx>')
def user(userx):
	if userx == 'admin':
		return redirect(url_for('admin'))
	else :
		return redirect(url_for('name',username=userx))

@app.route('/mydb', methods=['GET','POST'])
def mydb():
	if request.method == 'POST':
		#form data access
		# userdetails = request.form
		# test1 = userdetails['test1']
		# test2 = userdetails['test2']
		# cur = mysql.connection.cursor()
		# cur.execute("INSERT INTO `users`(`name` ,`email`) VALUES(%s, %s)",(name, email))
		# mysql.connection.commit()
		# cur.close()
		# conn = mysql.connect()
		# cursor = conn.cursor()
		# cursor.execute("INSERT INTO `table1`(`test1` ,`test2`) VALUES(%s, %s)",(test1, test2))
		# conn.commit()
		# conn.close() 
		if request.form['Execute']=='q1':
			return redirect('/q1')
		elif request.form['Execute']=='q2':
			return redirect('/q2')
		elif request.form['Execute']=='q3':
			return redirect('/q3')
		elif request.form['Execute']=='q4':
			return redirect('/q4')
		elif request.form['Execute']=='q5':
			return redirect('/q5')
		elif request.form['Execute']=='q6':
			return redirect('/q6')
		elif request.form['Execute']=='q7':
			return redirect('/q7')
		elif request.form['Execute']=='q8':
			return redirect('/q8')
		elif request.form['Execute']=='q9':
			return redirect('/q9')
		elif request.form['Execute']=='q10':
			return redirect('/q10')


	return render_template('index.html')


@app.route('/q1',methods=['GET','POST'])
def q1():
	if request.method == 'POST':
		userdetails = request.form
		iname = userdetails['fname']
		conn = mysql.connect()
		cursor = conn.cursor()
		resultq1=cursor.execute("SELECT * FROM `profile` WHERE `fname` = %s ",iname)
		conn.commit()
		conn.close() 
		if resultq1 > 0:
			info = cursor.fetchall()
		return render_template('q1.html',info=info)
	return render_template('query1.html')


@app.route('/q2',methods=['GET','POST'])
def q2():
	if request.method == 'POST':
		userdetails = request.form
		ipost = userdetails['postid']
		conn = mysql.connect()
		cursor = conn.cursor()
		resultq2=cursor.execute("SELECT `USER`,profile.fname FROM `post`,profile WHERE `postid` = %s AND post.`USER`=profile.idprofileid",ipost)
		conn.commit()
		conn.close() 
		if resultq2 > 0:
			info = cursor.fetchall()
		else:
			return 'NO RESULT FOUND'
		return render_template('q1.html',info=info)
	return render_template('query2.html')



@app.route('/q3',methods=['GET','POST'])
def q3():
	if request.method == 'POST':
		userdetails = request.form
		#ipost = userdetails['postid']
		conn = mysql.connect()
		cursor = conn.cursor()
		sql3 = """SELECT idprofileid,profile.fname AS name,post.likescount AS likes,comments.content AS content
		 FROM profile 
		 INNER JOIN post ON post.USER = profile.idprofileid
		 INNER JOIN comments ON comments.onpost = post.postid"""
		resultq3=cursor.execute(sql3)
		conn.commit()
		conn.close() 
		if resultq3 > 0:
			info = cursor.fetchall()
		return render_template('q1.html',info=info)
	return render_template('query3.html')


@app.route('/q4',methods=['GET','POST'])
def q4():
	if request.method == 'POST':
		userdetails = request.form
		likes = userdetails['likescount']
		conn = mysql.connect()
		cursor = conn.cursor()
		sql4 = """SELECT postid, CAST(SUM(likescount) AS SIGNED) likescount
		 FROM post 
		 GROUP BY postid
		 HAVING SUM(likescount) > %s"""
		resultq4=cursor.execute(sql4,likes)
		conn.commit()
		conn.close() 
		if resultq4 > 0:
			info = cursor.fetchall()
		else:
			return 'NO RESULT FOUND'
		return render_template('q1.html',info=info)

	return render_template('query4.html')



@app.route('/q5',methods=['GET','POST'])
def q5():
	if request.method == 'POST':
		userdetails = request.form
		conn = mysql.connect()
		cursor = conn.cursor()
		sql5 = """SELECT profile.fname,profile.lname,registereduser.eventid
		 FROM profile,registereduser 
		 WHERE registereduser.userprofile = profile.idprofileid """
		resultq5=cursor.execute(sql5)
		conn.commit()
		conn.close() 
		if resultq5 > 0:
			info = cursor.fetchall()
		else:
			return 'NO RESULT FOUND'
		return render_template('q1.html',info=info)

	return render_template('query5.html')


@app.route('/q6',methods=['GET','POST'])
def q6():
	if request.method == 'POST':
		userdetails = request.form
		conn = mysql.connect()
		cursor = conn.cursor()
		sql6 = """SELECT post.postid,post.likescount
		 FROM post
		 HAVING MAX(post.likescount) """
		resultq6=cursor.execute(sql6)
		conn.commit()
		conn.close() 
		if resultq6 > 0:
			info = cursor.fetchall()
		else:
			return 'NO RESULT FOUND'
		return render_template('q1.html',info=info)

	return render_template('query6.html')


@app.route('/q7',methods=['GET','POST'])
def q7():
	if request.method == 'POST':
		userdetails = request.form
		conn = mysql.connect()
		cursor = conn.cursor()
		sql7 = """SELECT registereduser.userprofile,profile.fname,count(*)
		 FROM registereduser,profile
		 WHERE registereduser.userprofile=profile.idprofileid
		 GROUP BY registereduser.userprofile
		 ORDER BY registereduser.eventid DESC """
		resultq7=cursor.execute(sql7)
		conn.commit()
		conn.close() 
		if resultq7 > 0:
			info = cursor.fetchall()
		else:
			return 'NO RESULT FOUND'
		return render_template('q1.html',info=info)

	return render_template('query7.html')


@app.route('/q8',methods=['GET','POST'])
def q8():
	if request.method == 'POST':
		userdetails = request.form
		friend1 = userdetails['friend1']
		friend2 = userdetails['friend 2']
		conn = mysql.connect()
		cursor = conn.cursor()
		sql8 = """SELECT friendlist.`friend 2` ,profile.fname
		 FROM friendlist,profile
		 WHERE friendlist.friend1=%s
		 AND
		 friendlist.`friend 2` IN (SELECT friendlist.`friend 2` FROM friendlist WHERE friendlist.friend1=%s)
		 AND
		 friendlist.`friend 2`=profile.idprofileid """
		t=(friend1,friend2)
		resultq8=cursor.execute(sql8,t)
		conn.commit()
		conn.close() 
		if resultq8 > 0:
			info = cursor.fetchall()
		else:
			return 'NO RESULT FOUND'
		return render_template('q1.html',info=info)

	return render_template('query8.html')

@app.route('/q9',methods=['GET','POST'])
def q9():
	if request.method == 'POST':
		userdetails = request.form
		location = userdetails['location']
		conn = mysql.connect()
		cursor = conn.cursor()
		sql9 = """SELECT registereduser.userprofile,profile.fname
		 FROM registereduser,profile
		 WHERE registereduser.eventid
		 IN (SELECT eventpg.pgid FROM eventpg WHERE eventpg.location =%s)
		 AND 
		 registereduser.userprofile = profile.idprofileid """
		t=location
		resultq9=cursor.execute(sql9,t)
		conn.commit()
		conn.close() 
		if resultq9 > 0:
			info = cursor.fetchall()
		else:
			return 'NO RESULT FOUND'
		return render_template('q1.html',info=info)

	return render_template('query9.html')


@app.route('/q10',methods=['GET','POST'])
def q10():
	if request.method == 'POST':
		userdetails = request.form
		pagename = userdetails['pagename']
		conn = mysql.connect()
		cursor = conn.cursor()
		sql10 = """SELECT eventpg.adminid,profile.fname
		 FROM eventpg,profile
		 WHERE eventname=%s
		 AND 
		 eventpg.adminid = profile.idprofileid """
		t=pagename
		resultq10=cursor.execute(sql10,t)
		conn.commit()
		conn.close() 
		if resultq10 > 0:
			info = cursor.fetchall()
		else:
			return 'NO RESULT FOUND'
		return render_template('q1.html',info=info)

	return render_template('query10.html')




 










	





	








if __name__ == '__main__':
	app.run(debug = True)
