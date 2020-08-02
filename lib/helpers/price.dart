String priceFormatter(int number) {
  return number
      .toString()
      .split('')
      .reversed
      .fold<List<List<String>>>([], (acc, numb) {
        if (acc.isEmpty) {
          acc.add([numb]);
          return acc;
        }

        final lastListIndex = acc.length - 1;
        final isLastListFull = acc[lastListIndex].length == 3;
        if (isLastListFull)
          acc.add([numb]);
        else
          acc[lastListIndex].add(numb);

        return acc;
      })
      .reversed
      .map((list) => list.reversed.join(''))
      .join(' ');
}
