class MovieTicket {
  final DateTime date;
  final String time;
  final String cinemaType;
  final List<int> selectedChairs;

  MovieTicket({
    required this.date,
    required this.time,
    required this.cinemaType,
    required this.selectedChairs,
  });
}
