begin_html = <<HTML
<!DOCTYPE html>
<html>
  <head>
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
    <h1>Factorial.language</h1>
HTML

end_html = <<HTML
    </div>
  </body>
</html>
HTML

desc "Generate an HTML summary of all our Snippets"
task :html do
  html = begin_html
  Dir['factorial*'].each do |file|
    extension = File.extname(file)[1..-1]
    lines = File.readlines(file)
    author = lines.shift.match(/Author: (.*)$/i).to_a.last
    code = lines.join('').strip

    snippet_author = (author || 'Unknown').gsub(%r{\W+}, '-').downcase
    snippet_html = <<-HTML
      <div id="#{snippet_author}-#{extension}">
        <h3 class="author">#{author || 'Unknown'}</h3>
        <p class="file">#{File.basename(file)}</p>
        <pre name="code" class="#{snippet_author} #{extension}">
#{code}
</pre>
      </div>
    HTML

    html += snippet_html
  end

  html += end_html

  File.open('snippets.html', 'w') { |f| f.write html }
end
