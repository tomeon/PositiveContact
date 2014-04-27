<div class="row">
  <h2>{{ action }} a Contact</h2>
  %if defined('error'):
  <h1>{{ error }}</h1>
  %end
  %if action == "Add":
  %     post = "/add"
  %elif action == "Edit":
  %     post = "/edit/" + key_str
  %end
  <form role="form" action="{{ post }}" method="POST"
      enctype="multipart/form-data">
      %# Render all fields in the variable passed to template as 'form'
      %for field in form:
      %# The next line of code is a bit weird.  According to the Bottle
      %# docs, the way to check whether a variable is defined in the
      %# current template namespace is to pass the variable ENCLOSED IN
      %# QUOTES to the 'defined()' function.
      %    if defined('field'):
      %        if field.id != "photo":
      <div class="form-group">
          <div class="input-group">
          {{ !field.label() }}:
          %if field.errors:
          {{ field.errors[0] }}
          %end
          %if field.id == "state":
          {{ !field(class_="form-control") }}
          %else:
          {{ !field(class_="form-control", size="100", maxlength="100") }}
          %end
          </div>
      </div>
      %        end
      %    end
      %end
      %#<div class="form-group">
      %#{{ !form.photo.label() }}:
      %#{{ !form.photo() }}
      %#%#<label for="photo">Upload a photograph:</label>
      %#%#<input type="file" class="filestyle" data-classButton="btn
      %#%#    btn-primary" data-input="false" name="photo" id="photo">
      %#</div>
      <div class="btn-group btn-group-justified">
        <div class="btn-group">
          <button type="submit" class="btn btn-primary" value="save">Save Contact</button>
        </div>
        <div class="btn-group">
          <a href="/" class="btn btn-danger">Cancel</a>
        </div>
      </div>
  </form>
</div>
<div class="row voffset4">
  <p><b>You can add a photo on the next screen<b></p>
</div>
