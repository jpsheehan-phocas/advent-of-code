(defn read-ints-from-file
  "Reads integers from a file."
  [file-path]
  (defn read-line-as-int
    "Reads a single line as an integer from a file."
    [f]
    (def line (file/read f :line))
    (if (nil? line) nil (scan-number (string/trim line))))

  (def f (file/open file-path))
  (def ns (array/new 100))
  (var n (read-line-as-int f))
  (while (not (nil? n))
    (array/push ns n)
    (set n (read-line-as-int f)))
  (file/close f)
  ns)

(def nums (read-ints-from-file "../res/day_01.txt"))
(def [x _] (reduce
             (fn [[acc prev] el] (if (> el prev) [(+ acc 1) el] [acc el]))
             [0 (first nums)]
             (slice nums 1 -1)))
(print x)
