(defn read-ints
  "Reads integers from a file."
  []
  (defn read-line-as-int
    "Reads a single line as an integer."
    []
    (def line (getline))
    (if (nil? line) nil (scan-number (string/trim line))))

  (def ns (array/new 100))
  (var n (read-line-as-int))
  (while (not (nil? n))
    (array/push ns n)
    (set n (read-line-as-int)))
  ns)

(def nums (read-ints))
(def [x _] (reduce
             (fn [[acc prev] el] (if (> el prev) [(+ acc 1) el] [acc el]))
             [0 (first nums)]
             (slice nums 1 -1)))
(print x)
