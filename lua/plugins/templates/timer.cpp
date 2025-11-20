
class Timer {

  std::chrono::high_resolution_clock::time_point begin =
      std::chrono::high_resolution_clock::now();

public:
  Timer() = default;
  ~Timer() {
    auto end = std::chrono::high_resolution_clock::now();
    auto elapsed =
        std::chrono::duration_cast<std::chrono::nanoseconds>(end - begin);
    printf("Time: \t%.10f seconds.\n", elapsed.count() * 1e-9);
  }
};
