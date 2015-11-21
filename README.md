[![Build Status](https://travis-ci.org/samuelreichert/projII.svg?branch=master)](https://travis-ci.org/samuelreichert/projII)

# Projeto Interdisciplinar Integrado 2
* Disciplina: _Projeto Interdisciplinar Integrado 2_
* Semestre: _6º Semestre_
* Curso: _Sistemas para Internet_
* Universidade: _Universidade Feevale_

## Dependencies
* Bundler
* Ruby 2.2.3
* PostgreSQL 9.3.10
* Imagemagick >= 6.7.7
* GraphViz

## Database creation
```
    bundle exec rake db:create
    bundle exec rake db:migrate
```

## Install and run
```
    bundle install
    bundle exec foreman start -f Procfile.development
```

## Generate ER Diagram
```
    bundle exec erd
```

## Using in this project
* EditorConfig - See more here: http://EditorConfig.org
* Devise - https://github.com/plataformatec/devise
* ActiveAdmin - http://activeadmin.info/
* Letter Opener - https://github.com/ryanb/letter_opener
* Mandrill and MailChimp
