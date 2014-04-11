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

There's also a handy `backgroundView` property. You can put whatever you want there. Let's say you have a gradient view. Do something like this:

```objc
CMDAwesomeButton *gradientButton = [CMDAwesomeButton new];

SAMgradientView *gradientView = [SAMGradientView new];
gradientView.backgroundColor = [UIColor clearColor];
gradientButton.backgroundView = gradientView;

[gradientButton setValue:@[
    [UIColor colorWithRed:0.145 green:0.769 blue:0.757 alpha:1.000],
    [UIColor colorWithRed:0.196 green:0.678 blue:0.800 alpha:1.000]
] forKeyPath:@"backgroundView.gradientColors" state:UIControlStateNormal];
[gradientButton setValue:@[
    [UIColor colorWithRed:0.145 green:0.769 blue:0.757 alpha:0.5],
    [UIColor colorWithRed:0.196 green:0.678 blue:0.800 alpha:0.5]
] forKeyPath:@"backgroundView.gradientColors" state:UIControlStateHighlighted];
```

Boom. ([SAMGradientView](https://github.com/soffes/SAMGradientView) is great. I use it in all my apps.)

If you would like more convenience setters feel free to send me a pull request!
