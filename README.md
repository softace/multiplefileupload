Multiple File Upload
--------------------

A small web application for investigating browser behaviour when
POSTing multiple files

It is a small web application that has one input field for multiple file upload, like:

    <form enctype="multipart/form-data" method="post">
      <input multiple="multiple" name="upload[files][]" type="file" />
    </form>

The application simply spits out the the POST request body, so that you can see how different browser provide the multiple files over HTTP.

The purpose of this application is to help test frameworks to mimick browser behaviour upon uploading mulitiple files in a single form `input` element with `type="file"` attribute.

For project page see https://github.com/softace/multiplefileupload


