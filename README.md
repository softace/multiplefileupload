Multiple File Upload
--------------------

A small web application for investigating browser behaviour when
POSTing multiple files

It is a small web application that has one input field for multiple file upload, like:

    <form enctype="multipart/form-data" method="post">
      <input multiple="multiple" name="upload[files][]" type="file" />
    </form>

The application does not store the uploaded files anywhere, neither on disk, nor in a database. It is 100% stateless.

The application simply spits out the the POST request body, so that you can see how different browser provide the multiple files over HTTP. If the request body exceeds 1000 bytes it will fail gracefully.

The purpose of this application is to help test frameworks to mimick browser behaviour upon uploading mulitiple files in a single form `input` element with `type="file"` attribute.

The application is installed on http://www.multiplefileupload.eu/

The source code is available at https://github.com/softace/multiplefileupload


