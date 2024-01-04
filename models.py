"""Models for Blogly."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def connect_db(app):
    db.app = app
    db.init_app(app)
    app.app_context().push()


class User(db.Model):
    __tablename__ = 'users'

    def __repr__(self):
        u = self
        return f"<User {u.first_name}-{u.last_name}>"

    id = db.Column(db.Integer,
                   primary_key=True,
                   autoincrement=True)

    first_name = db.Column(db.String(50),
                           nullable=False)

    last_name = db.Column(db.String(50),
                          nullable=False)

    image_url = db.Column(db.String(100),
                          default='images/img.jpg')

    posts = db.relationship('Post')


class Post(db.Model):
    __tablename__ = 'posts'

    def __repr__(self):
        u = self
        return f"<Post --{u.title}-->"

    id = db.Column(db.Integer,
                   primary_key=True,
                   autoincrement=True)

    title = db.Column(db.String(100),
                      nullable=False)

    content = db.Column(db.Text)

    created_at = db.Column(db.DateTime,
                           nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))

    user = db.relationship('User')
