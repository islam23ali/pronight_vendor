import 'package:flutter/material.dart';

import 'error_layout.dart';
import 'loading_spinner.dart';
import 'no_data.dart';



class ScreenStateLayout extends StatelessWidget {
  final bool _isEmpty;
  final bool _isLoading;
  final String? _error;
  final WidgetBuilder? _errorBuilder;
  final WidgetBuilder? _loadingBuilder;
  final VoidCallback? _onRetry;
  final WidgetBuilder _builder ;

  const ScreenStateLayout({super.key,
    required  WidgetBuilder builder,
    bool isEmpty = false,
    String? error,
    bool isLoading = false,
    WidgetBuilder? errorBuilder,
    WidgetBuilder? loadingBuilder,
    VoidCallback? onRetry,
  })
      :_isEmpty = isEmpty,
        _isLoading = isLoading,
        _error= error,
        _errorBuilder = errorBuilder,
        _loadingBuilder = loadingBuilder,
        _builder = builder,
        _onRetry = onRetry;

  @override
  Widget build(BuildContext context) {
    return  _buildView(context);
  }

  Widget _buildView(BuildContext context) {
    if (_isLoading) {
      return _loadingBuilder!=null? _loadingBuilder(context): const Center(child: LoadingSpinner());
    }   else if(_error != null){
      return _errorBuilder!=null? _errorBuilder(context): ErrorLayout( onRetry: _onRetry, error: _error,);
    } else if(_isEmpty){
      return const NoDataScreen();
    } else{
      return _builder(context);
    }

  }
}
