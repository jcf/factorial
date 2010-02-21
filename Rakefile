# encoding: utf-8

require 'erb'
include ERB::Util

begin_html = <<HTML
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>Factorial.language</title>
  <style>
    body {
      margin: 40px 0;
      font: 14px 'Helvetica Neue', helvetica, sans-serif;
      color: #444;
    }
    pre {
      font: 11px Menlo, monospace;
      background-color: #fafafa;
      border: 1px solid #ccc;
      margin: 10px 0;
      padding: 5px;
    }
    #snippets {
      margin: 0 auto;
      width: 600px;
    }
  </style>
  </head>
  <body>
    <div id="snippets">
    <h1>
      <a href="http://github.com/jcf/factorial">Factorial.language</a>
    </h1>
HTML

end_html = <<HTML
    </div>
  </body>
</html>
HTML

desc "Generate an HTML summary of all our Snippets"
task :html do
  html = begin_html
  Dir['*'].each do |path|
    next unless File.directory?(path)

    html += %Q{    <div class="#{path}">\n}
    html += %Q{      <h2 class="language">#{path}</h2>\n}

    Dir[path + '/*'].each do |file|
      extension = File.extname(file)[1..-1]
      author = File.basename(file, ".#{extension}")

      lines = File.readlines(file)

      # This is a little bit of authentic code smell
      code = lines.reject! { |line| line =~ /Author: (.*)$/i }
      code = html_escape(code.join('').strip)

      snippet_author = lines.join.gsub(%r{\W+}, '-').downcase
      snippet_html = <<-HTML
      <div id="#{snippet_author}-#{extension}">
        <h4 class="author">#{author}</h3>
        <pre class="#{snippet_author} #{extension}">
#{code}
</pre>
      </div>
    HTML

      html += snippet_html
      
      html += %Q{    </div>\n\n}
    end
  end

  html += end_html

  File.open('snippets.html', 'w') { |f| f.write html }
end
