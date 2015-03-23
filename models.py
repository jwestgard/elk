from app import db


class Asset(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), index=True)
    bytes = db.Column(db.Integer)
    batch_id = db.Column(db.Integer, db.ForeignKey('batch.id'))

    def __repr__(self):
        return '<Asset %r>' % (self.name)


class Batches(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64))
    date = db.Column(db.DateTime)

    def __repr__(self):
        return '<Batch %r>' % (self.name)
        
