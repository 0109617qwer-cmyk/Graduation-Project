import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/weather_view.dart';
import '../weather/weather_cubit.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController =
  TextEditingController();
  List<String> searchHistory = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      searchHistory =
          prefs.getStringList('searchHistory') ?? [];
    });
  }

  Future<void> _saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'searchHistory',
      searchHistory,
    );
  }

  void _onSearch() async {
    final city = searchController.text.trim();
    if (city.isNotEmpty) {
      setState(() {
        if (!searchHistory.contains(city)) {
          searchHistory.insert(0, city);
        }
      });
      await _saveHistory();

      BlocProvider.of<WeatherCubit>(
        context,
      ).getForecastWeather(5, city);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Weatherview(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 28, 33, 70),
              Color.fromARGB(255, 88, 36, 179),
              Color(0xFFE14DFF),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search city...",
                  hintStyle: const TextStyle(
                    color: Colors.white70,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  contentPadding:
                  const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.amber,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  onPressed: _onSearch,
                  child: const Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: searchHistory.isEmpty
                    ? const Center(
                  child: Text(
                    "No recent searches",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                )
                    : Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      children: [
                        const Text(
                          "Search History:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            setState(
                                  () => searchHistory
                                  .clear(),
                            );
                            final prefs =
                            await SharedPreferences.getInstance();
                            await prefs.remove(
                              'searchHistory',
                            );
                          },
                          child: const Text(
                            "Clear All",
                            style: TextStyle(
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                        searchHistory.length,
                        itemBuilder: (context, index) {
                          final city =
                          searchHistory[index];
                          return Card(
                            color: Colors.white
                                .withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                15,
                              ),
                            ),
                            child: ListTile(
                              leading: const Icon(
                                Icons.history,
                                color: Colors.amber,
                              ),
                              title: Text(
                                city,
                                style:
                                const TextStyle(
                                  color: Colors
                                      .white,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors
                                      .redAccent,
                                ),
                                onPressed: () async {
                                  setState(
                                        () =>
                                        searchHistory
                                            .removeAt(
                                          index,
                                        ),
                                  );
                                  await _saveHistory();
                                },
                              ),
                              onTap: () {
                                searchController
                                    .text =
                                    city;
                                _onSearch();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
