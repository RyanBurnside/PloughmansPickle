(in-package :haggis)

(defun quit-application (w)
  (declare (ignore w))
  (format t "Quitting~%")
  ;; according to tutorial, never call gtk-main-quit.
  (gtk:leave-gtk-main))

(defun handle-key-event (w event-key)
  (declare (ignore w))
  (format t "Key event: (~S) ~S[~S]~%"
          (gdk:gdk-event-key-type event-key)
          (gdk:gdk-event-key-string event-key)
          (gdk:gdk-event-key-keyval event-key)))

(defun doit ()
  (let ((top-level nil)
        (ui-file (namestring (asdf:system-relative-pathname
                              :haggis "haggis/hello-world.glade"))))

    (format t "Attempting to load ui-file: ~S~%" ui-file)

    (gtk:within-main-loop
     (let ((builder (make-instance 'gtk:gtk-builder)))
       (gtk:gtk-builder-add-from-file builder ui-file)
       (gtk:gtk-builder-connect-signals
        builder `(("menu-file-quit" quit-application)
                  ("key-press-event" handle-key-event)
                  ("key-release-event" handle-key-event)))


       (setf top-level (gtk:gtk-builder-get-object builder "top_level"))
       (format t "Created toplevel ~A~%" top-level)

       ;; Signal handler for the window to handle the signal "destroy".
       (gobject:g-signal-connect
        top-level "destroy"
        (lambda (widget)
          (declare (ignore widget))
          (format t "Destroy Event Occured.~%")
          (gtk:leave-gtk-main)))

       ;; Signal handler for the window to handle the signal "delete-event".
       (gobject:g-signal-connect
        top-level "delete-event"
        (lambda (widget event)
          (declare (ignore widget event))
          (format t "Delete Event Occured.~%")
          (gtk:leave-gtk-main)))

       (gtk:gtk-widget-show-all top-level)))

    (gtk:join-gtk-main)

    (gtk:within-main-loop
     (gtk:gtk-widget-destroy top-level))))
