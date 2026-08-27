(in-package #:log-backend-vom/tests)

(deftest use-vom-backend-binds
  (let ((log-protocol:*log-backend* nil))
    (log-backend-vom:use-vom-backend)
    (ok (typep log-protocol:*log-backend* 'log-backend-vom:vom-backend))))

(deftest vom-backend-writes-text
  (let ((log-protocol:*log-backend* nil)
        (log-protocol:*log-context* nil)
        (log-protocol:*log-layout* :text)
        (log-protocol:*log-level* :info)
        (log-protocol:*log-filters* nil)
        (log-protocol:*log-async* nil)
        (line nil))
    (unwind-protect
         (setf line
               (with-output-to-string (out)
                 (log-backend-vom:use-vom-backend :stream out)
                 (log-protocol:configure :level :info :layout :text)
                 (log-protocol:info "hello vom")))
      (ignore-errors (log-protocol:shutdown-async)))
    (ok (search "INFO" line))
    (ok (search "hello vom" line))))
