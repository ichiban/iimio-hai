(require :cl-cairo2)

(defpackage :iimio-hai
  (:use :cl :cl-cairo2)
  (:export :generate))

(in-package :iimio-hai)

(defparameter *width* 256)
(defparameter *height* 256)

(defun generate (&optional (out "iimio-hai.png"))
  (with-png-file (out :argb32 *width* *height*)
    (set-line-width 20.0)
    (set-line-cap :round)
    (set-source-rgb 0 0 0)
    (set-font-size 50)
    (select-font-face "Arial" :normal :bold)

    (move-to (- (/ *width* 2) 10) (/ *height* 2))
    (rel-move-to 0 -20)
    (show-text "#")

    (move-to (/ *width* 2) (/ *height* 2))
    (rel-move-to 0 -5)
    (arc (/ *width* 2) (/ *height* 2) 5 0 (* 2 pi))

    (move-to (/ *width* 2) (/ *height* 2))
    (rel-move-to 30 0)
    (arc (/ *width* 2) (/ *height* 2) 30 0 (/ pi 2))

    (ray (- (/ pi 4)))
    (ray (- (/ pi 2)))
    (ray 0)
    (ray (/ pi 2))
    (ray (/ pi 4))

    (stroke)))
    
(defun ray (angle)
  (move-to (/ *width* 2) (/ *height* 2))
  (let ((x (* 30 (sin angle)))
	(y (* 30 (cos angle))))
    (rel-move-to x y))
  (let ((x (* 40 (sin angle)))
	(y (* 40 (cos angle))))
    (rel-line-to x y)))
