from flask import Blueprint, render_template, request, redirect, url_for, current_app
from flask_bcrypt import Bcrypt
from flask import session

user_bp = Blueprint('user_bp', __name__)
bcrypt = Bcrypt()

@user_bp.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        connection = current_app.connection
        try:
            with connection.cursor() as cursor:
                cursor.execute("SELECT password FROM usuario WHERE email=%s", (email,))
                result = cursor.fetchone()
                if result and bcrypt.check_password_hash(result['password', password]):
                    session['user_email'] = email
                    return redirect(url_for('user_bp.inicio'))
                else:
                    return redirect(url_for('user_bp.login'))
        except Exception as e:
            return str(e)
    return render_template('login.html')

@user_bp.route('/inicio', methods=['GET', 'POST'])

def inicio():
    return render_template('index.html')
    