from flask import Flask, render_template
from flask.ext.bootstrap import Bootstrap
from flask.ext.moment import Moment
from flask.ext.script import Manager
from datetime import datetime
from flask.ext.sqlalchemy import SQLAlchemy

import os

app = Flask(__name__)
bootstrap = Bootstrap(app)
moment = Moment(app)
manager = Manager(app)
db = SQLAlchemy(app)

app.config.from_object('config')

class Manuscript(db.Model):
    __tablename__ = 'lk'
    lk_id = db.Column(db.Integer, primary_key=True)
    lk_shelfmark = db.Column(db.String(100), index=True)

@app.route('/')
def index():
    return render_template('index.html',
                            current_time=datetime.utcnow())

@app.route('/ms/<id>')
def ms(id):
    manuscript = Manuscript.query.get(id)
    return render_template('ms.html', manuscript = manuscript)

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

if __name__ == '__main__':
    manager.run()
