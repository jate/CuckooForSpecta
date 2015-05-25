#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "CuckooUser.h"

@interface ViewController ()

@property (strong, nonatomic) AFHTTPSessionManager *httpSessionManager;
@property (strong, nonatomic) CuckooUser *cuckooUser;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *jsonURL = [NSURL URLWithString:@"http://jsonplaceholder.typicode.com"];
    self.httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:jsonURL];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(cuckooUserUpdated:)
                                                 name:@"CuckooUserUpdatedNotification"
                                               object:nil];
    
    self.cuckooUser = [[CuckooUser alloc] initWithHTTPSessionManager:self.httpSessionManager];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - NSNotification

- (void)cuckooUserUpdated:(NSNotification *)notification
{
    self.nameLabel.text = self.cuckooUser.name;
    self.usernameLabel.text = self.cuckooUser.username;
    self.emailLabel.text = self.cuckooUser.email;
}

@end
