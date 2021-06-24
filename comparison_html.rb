
def make_html(h1, main_data)
  data = <<EOF
  <!DOCTYPE html>
  <html lang="en" dir="ltr">
    <head>
      <meta charset="utf-8">
      <title>#{h1}</title>
      <link rel=stylesheet href=style.css>
    </head>
    <body>
      <h1>#{h1}</h1>
      <div id="container">
  #{main_data}
      </div>
    </body>
  </html>
EOF
end

public
def load_file(in_dir, html)
  source = (File.open("#{in_dir}#{html}")).read
  source.slice(source.index('<body>') + 6 .. source.index('<footer>') - 1)
end

#入力用ディレクトリ
in_dir = "C:\\xx\\xxx\\"

#出力ファイル名　※　末尾に.htmlが付きます。
file_name = "xxx"#.html

#見出し名
h1 = "xxx"

#比較html（配列、拡張子込みにて）
f_name = ['zzz1.html','zzz2.html']

main_data = ""
f_name.map! {|file| file.load_file(in_dir, file) }
f_name.each {|file| main_data += "<div>#{file}</div>" }
File.open("#{file_name}.html", "w") do |f|
  f.puts make_html(h1, main_data)
end
