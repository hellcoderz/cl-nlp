;;; (c) 2014 Vsevolod Dyomkin

(in-package #:nlearn)
(named-readtables:in-readtable rutils-readtable)

(deftest serialize-model ()
  (unwind-protect
       (let ((dummy-model (make 'categorical-model
                                :weights #h(:a #h('f::x 1.0 'f::y 2.0)
                                            :b #h('f::x 2.0 'f::z 0))))
             (restored-model (make 'categorical-model)))
         (save-model dummy-model "/tmp/dummy-model")
         (load-model restored-model "/tmp/dummy-model")
         (should be equalp
                 (m-weights dummy-model)
                 (m-weights restored-model)))
    (ignore-errors (delete-file "/tmp/dummy-model"))))
