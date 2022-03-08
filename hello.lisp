(load "./quicklisp/setup.lisp")
(ql:quickload :swank)
(ql:quickload :hunchentoot)

;; TODO: need to figure out how to expose a swank port, hopefully over an SSH tunnel.

;; (defparameter *swank-port* 4005)
;; (defparameter *swank-server*
;;  (swank:create-server :port *swank-port* :dont-close t))

(hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 4242))

(hunchentoot:define-easy-handler (say-hello :uri "/hello") (name)
  (setf (hunchentoot:content-type*) "text/plain")
  (format nil "Hello~@[ ~A~]!" name))

(write-line "Hunchentoot startup is complete")

(sb-thread:join-thread 
 (find-if
  (lambda (th) (string= (sb-thread:thread-name th) "hunchentoot-listener-*:4242"))
  (sb-thread:list-all-threads))))
