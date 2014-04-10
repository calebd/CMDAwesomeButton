# CMDAwesomeButton

This is my button subclass. It is awesome.

It is powered by one method:

```objc
- (void)setValue:(id)value forKeyPath:(NSString *)keyPath controlState:(UIControlState)state;
```

This lets you set any value for any keypath for the given control state.

It also has convenience setters for a few common tasks:

```objc
- (void)setBackgroundColor:(UIColor *)color forControlState:(UIControlState)state;
- (void)setBorderColor:(UIColor *)color forControlState:(UIControlState)state;
- (void)setBorderWidth:(CGFloat)width forControlState:(UIControlState)state;
- (void)setCornerRadius:(CGFloat)radius forControlState:(UIControlState)state;
```

That's it. Awesome right?

If you would like more convineince setters feel free to send me a pull request!
