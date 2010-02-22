# encoding: utf-8

require 'erb'
include ERB::Util

AUTHOR_PATTERN = /Author: (.*)$/i

begin_html = <<HTML
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <meta name="viewport" content="width=600, user-scalable=yes">
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
    .snippet {
      background-color: #fff;
      margin-bottom: 10px;
      padding: 10px;
    }
    h2.language {
      /* border-bottom: 1px solid #ccc; */
      margin: 0 0 10px;
    }
    h4.author {
      color: #999;
    }
    h4.author span:first-child {
      margin-right: 10px;
      color: #444;
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

    html += %Q{    <div class="snippet #{path}">\n}
    html += %Q{      <h2 class="language">#{path}</h2>\n}

    Dir[path + '/*'].each do |file|
      extension = File.extname(file)[1..-1]

      lines = File.readlines(file)

      # This is a little bit of authentic code smell
      author_line = lines.detect { |line| line =~ AUTHOR_PATTERN }
      author = author_line.scan(AUTHOR_PATTERN).flatten.last || 'Unknown'
      code = html_escape(lines.reject { |line| line =~ AUTHOR_PATTERN }.join('').strip)

      heading = ["<span>#{author}</span>"]
      heading.unshift('<span>' + File.basename(file) + '</span>') unless File.basename(file, ".#{extension}") == author
      heading = heading.join(' ')

      snippet_author = author.gsub(%r{\W+}, '-').downcase
      snippet_html = <<-HTML
      <div id="#{snippet_author}-#{extension}">
        <h4 class="author">#{heading}</h4>
        <pre class="#{snippet_author} #{extension}">
#{code}
</pre>
      </div>
    HTML

      html += snippet_html
    end

    html += %Q{    </div>\n\n}
  end

  html += end_html

  File.open('snippets.html', 'w') { |f| f.write html }
end
