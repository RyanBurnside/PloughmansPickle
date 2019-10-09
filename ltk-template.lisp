;;;; ltk-template.lisp

(in-package #:ltk-template)
(in-package #:ltk)



;;; "ltk-template" goes here. Hacks and glory await!
(with-ltk ()
  (wm-title *tk* "Ploughman's Pickle")
  ;(set-geometry *tk* 480 320 0 0)
  (let* ((hull (make-instance 'frame :master *tk*))
	 (canvas (make-instance 'canvas
				:master hull
				:width 256
				:height 320))
	 (input-hull (make-instance 'labelframe :master hull :text "Tile Attributes"))
	 
	 (name-label (make-instance 'label :master input-hull :text "Name: "))
	 (name-entry (make-instance 'entry :master input-hull))
	 (name-id-label (make-instance 'label :master input-hull :text "-"))
	 (name-id-entry (make-instance 'spinbox :master input-hull :width 4 :from 0 :to 9999 :increment 1))
	 (x-label (make-instance 'label :master input-hull :text "X: "))
	 (x-entry (make-instance 'spinbox :master input-hull :width 4 :from 0 :increment 8 :to 9999))
	 (y-label (make-instance 'label :master input-hull :text "Y: "))
	 (y-entry (make-instance 'spinbox :master input-hull :width 4 :from 0 :increment 8 :to 9999))
	 (width-label (make-instance 'label :master  input-hull :text "Width: "))
	 (width-entry (make-instance 'entry :master  input-hull :width 4 :text 8))
	 (height-label (make-instance 'label :master input-hull :text "Height: "))
	 (height-entry (make-instance 'entry :master input-hull :width 4 :text 8))
	 (comments-label (make-instance 'label :master input-hull :text "Comments: "))
	 (comments (make-instance 'text :master input-hull :width 40 :height 4 :wrap "WORD"))
	 (grid-hull (make-instance 'labelframe :master hull :text "Grid"))
	 (grid-checkbox (make-instance 'check-button :master
				       grid-hull :text "Snap"))
	 (grid-square (make-instance 'check-button :master
				       grid-hull :text "Square"))
	 (grid-x-label (make-instance 'label :master grid-hull :text "Size X:"))
	 (grid-x-entry (make-instance 'entry :master grid-hull :width 4 :text 8))
	 (grid-y-label (make-instance 'label :master grid-hull :text "Size Y:"))
	 (grid-y-entry (make-instance 'entry :master grid-hull :width 4 :text 8))
	 
	 )
    
    (grid hull 0 0)
    (grid canvas 0 0 :sticky "NW" :rowspan 2)
    (grid input-hull 0 1 :sticky "NW")

    
    (grid name-label 0 1 :sticky "NE")
    (grid name-entry 0 2 :sticky "NW")
    (grid name-id-label 0 3 :sticky "NW")
    (grid name-id-entry 0 4 :sticky "NW")

    (grid x-label 1 1 :sticky "NE")
    (grid x-entry 1 2 :sticky "NW")
    (grid y-label 2 1 :sticky "NE")
    (grid y-entry 2 2 :sticky "NW")
    (grid width-label 3 1 :sticky "NE")
    (grid width-entry 3 2 :sticky "NW")
    (grid height-label 4 1 :sticky "NE")
    (grid height-entry 4 2 :sticky "NW")
    (grid comments-label 5 1 :sticky "NE")
    (grid comments 5 2 :sticky "NW" :columnspan 3)

    (grid grid-hull 1 1 :sticky "NW")
    (grid grid-checkbox 0 0 :sticky "NE")
    (grid grid-square 0 1 :sticky "NW")
    (grid grid-x-label 1 0 :sticky "NE")
    (grid grid-x-entry 1 1 :sticky "NW")
    (grid grid-y-label 2 0 :sticky "NE")
    (grid grid-y-entry 2 1 :sticky "NW")
    
    (configure canvas :background "#000000")))



