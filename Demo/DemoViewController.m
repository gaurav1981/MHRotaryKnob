
#import "DemoViewController.h"
#import "MHRotaryKnob.h"

@implementation DemoViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	self.rotaryKnob.interactionStyle = MHRotaryKnobInteractionStyleRotating;
	self.rotaryKnob.scalingFactor = 1.5f;
	self.rotaryKnob.maximumValue = self.slider.maximumValue;
	self.rotaryKnob.minimumValue = self.slider.minimumValue;
	self.rotaryKnob.value = self.slider.value;
	self.rotaryKnob.defaultValue = self.rotaryKnob.value;
	self.rotaryKnob.resetsToDefault = YES;
	self.rotaryKnob.backgroundColor = [UIColor clearColor];
	self.rotaryKnob.backgroundImage = [UIImage imageNamed:@"Knob Background.png"];
	[self.rotaryKnob setKnobImage:[UIImage imageNamed:@"Knob.png"] forState:UIControlStateNormal];
	[self.rotaryKnob setKnobImage:[UIImage imageNamed:@"Knob Highlighted.png"] forState:UIControlStateHighlighted];
	[self.rotaryKnob setKnobImage:[UIImage imageNamed:@"Knob Disabled.png"] forState:UIControlStateDisabled];
	self.rotaryKnob.knobImageCenter = CGPointMake(80.0f, 76.0f);
	[self.rotaryKnob addTarget:self action:@selector(rotaryKnobDidChange) forControlEvents:UIControlEventValueChanged];
}

- (IBAction)sliderDidChange
{
	self.label.text = [NSString stringWithFormat:@"%.3f", self.slider.value];
	self.rotaryKnob.value = self.slider.value;
}

- (IBAction)rotaryKnobDidChange
{
	self.label.text = [NSString stringWithFormat:@"%.3f", self.rotaryKnob.value];
	self.slider.value = self.rotaryKnob.value;
}

- (IBAction)toggleEnabled
{
	self.rotaryKnob.enabled = !self.rotaryKnob.enabled;
}

- (IBAction)toggleContinuous
{
	self.slider.continuous = !self.slider.continuous;
	self.rotaryKnob.continuous = !self.rotaryKnob.continuous;
}

- (IBAction)goToMinimum
{
	[self.slider setValue:self.slider.minimumValue animated:YES];
	[self.rotaryKnob setValue:self.rotaryKnob.minimumValue animated:YES];
}

- (IBAction)goToMaximum
{
	[self.slider setValue:self.slider.maximumValue animated:YES];
	[self.rotaryKnob setValue:self.rotaryKnob.maximumValue animated:YES];
}

- (IBAction)toggleInteractionStyle:(UIButton *)sender
{
	MHRotaryKnobInteractionStyle style = self.rotaryKnob.interactionStyle + 1;

	if (style > MHRotaryKnobInteractionStyleSliderVertical)
		style = MHRotaryKnobInteractionStyleRotating;

	self.rotaryKnob.interactionStyle = style;

	switch (style)
	{
		case MHRotaryKnobInteractionStyleRotating:
			[sender setTitle:@"Style: Rotating" forState:UIControlStateNormal];
			break;

		case MHRotaryKnobInteractionStyleSliderHorizontal:
			[sender setTitle:@"Style: Horizontal" forState:UIControlStateNormal];
			break;

		case MHRotaryKnobInteractionStyleSliderVertical:
			[sender setTitle:@"Style: Vertical" forState:UIControlStateNormal];
			break;
	}
}

@end
