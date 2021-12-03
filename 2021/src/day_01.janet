(def nums
  (take-until nil?
              (fiber/new
                (fn []
                  (while true
                    (def line (getline))
                    (yield (if (nil? line) nil (scan-number (string/trim line)))))))))

(def [x _] (reduce
             (fn [[acc prev] el] (if (> el prev) [(+ acc 1) el] [acc el]))
             [0 (first nums)]
             (slice nums 1 -1)))
(print x)
