FactoryGirl.define do
  factory(:post) do
    title('Today was a Good Day')
    text('Today was a good day because these good things happened.')
    tag_list('hi, hello, world')
  end

  factory(:comment) do
    text('This is a comment.')
  end

  factory(:user) do
    email('name@email.com')
    password('notpassword')
    password_confirmation('notpassword')
  end
end
