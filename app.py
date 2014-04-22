from framework import bottle
#from google.appengine.ext.webapp.util import run_wsgi_app


app = application = bottle.Bottle()


@app.route('/')
def index():
    data = "Hello, world!"
    return bottle.template('templates/home', {'data': data, 'proj_name': "Positive Contact"})


@app.route('/stuff')
def stuff():
    return "<h4>Here's the stuff you wanted...</h4>"


@app.error(403)
def error403(code):
    return "Invalid code specified"


@app.error(404)
def error404(code):
    return "That resource does not exist"


if __name__ == "__main__":
    bottle.run(server="gae", debug=True)
