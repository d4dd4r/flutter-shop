class FavoriteState {
  static Map<String, bool> merge(
          Map<String, bool> state, Map<String, bool> newState) =>
      {...state, ...newState};

  static Map<String, bool> switchProduct(
          Map<String, bool> state, String productId) =>
      {...state, productId: !(state[productId] ?? false)};

  static bool isProductFavorite(Map<String, bool> state, String productId) =>
      state[productId] ?? false;

  final Map<String, bool> _productFavoriteMap;

  const FavoriteState({Map<String, bool> productFavoriteMap = const {}})
      : _productFavoriteMap = productFavoriteMap;

  Map<String, bool> get all {
    return {..._productFavoriteMap};
  }
}
