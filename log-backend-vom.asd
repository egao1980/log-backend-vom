(defsystem "log-backend-vom"
  :version "0.1.1"
  :description "vom backend for log-protocol"
  :author "egao1980"
  :license "MIT"
  :depends-on ("log-protocol" "vom")
  :properties (:cl-repo (:ci (:sources (("vom" :ql) ("rove" :ql)))))
  :serial t
  :pathname "src"
  :components ((:file "package")
               (:file "backend"))
  :in-order-to ((test-op (test-op "log-backend-vom/tests"))))

(defsystem "log-backend-vom/tests"
  :depends-on ("log-backend-vom" "rove")
  :pathname "tests"
  :serial t
  :components ((:file "package")
               (:file "backend-test"))
  :perform (test-op (o c)
             (unless (symbol-call :rove :run c)
               (error "tests failed for ~A" (component-name c)))))
