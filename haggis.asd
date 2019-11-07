(asdf:defsystem #:haggis
  :description "Animation Tile Thingy"
  :author "Peter Keller & Ryan Burnside"
  :license "MIT License"
  :depends-on (#:cl-cffi-gtk)
  :serial t
  :components ((:file "haggis/package")
               (:file "haggis/hello-world")))
