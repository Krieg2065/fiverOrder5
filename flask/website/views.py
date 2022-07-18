from flask import Blueprint, render_template, request, flash, jsonify
from flask_login import login_required, current_user
from .models import Url 
from . import db
import json
import whois

views = Blueprint('views', __name__)


@views.route('/', methods=['GET', 'POST'])
@login_required
def home():
    d = {}
    if request.method == 'POST':
        host = request.form.get('url')
        if host.find(".") == -1 or len(host) < 1  :
            flash('Url is invalid!', category='error')
        else:
            print(host.find("."))
            res = whois.whois(host)
            new_url = Url(data=host, user_id=current_user.id)
            #creazione con model da creare
            db.session.add(new_url)
            db.session.commit()
            flash('Website Found!', category='success')
            d = {
                'domain_name': res.domain_name,
                'registrar': res.registrar,
                'whois_server': res.whois_server,
                'updated_date': res.updated_date,
                'creation_date': res.creation_date
            }
    return render_template("home.html", user=current_user,d = d)
    
@views.route('/history', methods=['GET', 'POST'])
@login_required
def history():
    return render_template("history.html", user=current_user)

@views.route('/delete-url', methods=['POST'])
def delete_url():
    url = json.loads(request.data)
    urlId = url['urlId']
    url = Url.query.get(urlId)
    if url:
        if url.user_id == current_user.id:
            db.session.delete(url)
            db.session.commit()

    return jsonify({})
