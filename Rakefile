namespace :build do
  desc 'Generate HTML output'
  task :html do
    puts "Converting to HTML..."
    `bundle exec asciidoctor book/Heading-for-the-Yocto-Project.adoc`
    puts " -- HTML output at book/Heading-for-the-Yocto-Project.html"
  end

  desc 'Generate EPub output'
  task :epub do
    puts "Converting to EPub..."
    `bundle exec asciidoctor-epub3 book/Heading-for-the-Yocto-Project.adoc`
    puts " -- Epub output at book/Heading-for-the-Yocto-Project.epub"
  end

  desc 'Generate Mobi (kf8) output'
  task :mobi do
    puts "Converting to Mobi (kf8)..."
    `bundle exec asciidoctor-epub3 -a ebook-format=kf8 book/Heading-for-the-Yocto-Project.adoc`
    puts " -- Mobi output at book/Heading-for-the-Yocto-Project.mobi"
  end

  desc 'Generate PDF output'
  task :pdf do
    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor-pdf -a pdf-style=book \
                                 -a pdf-stylesdir=theme/pdf \
                                 book/Heading-for-the-Yocto-Project.adoc`
    puts " -- PDF  output at book/Heading-for-the-Yocto-Project.pdf"
  end

end

desc 'Build all default formats'
task :build => [ "build:html", "build:epub", "build:mobi", "build:pdf" ]

desc 'Default task'
task :default => [ "build" ]
