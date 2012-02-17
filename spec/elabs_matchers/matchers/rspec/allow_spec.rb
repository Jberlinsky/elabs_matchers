require 'spec_helper'

describe ElabsMatchers::Matchers::Rspec::Allow do
  let(:post) { ElabsMatchers::Orm::Post.create(:title => "New", :body => "Lorem") }
  subject { post }

  context "with one example value" do
    context "with one attribute" do
      it { should allow("Elabs").as(:title) }
      it { should_not allow("").as(:title) }

      it { expect { should allow("").as(:title) }.to fail_assertion }
      it { expect { should_not allow("Elabs").as(:title) }.to fail_assertion }
      it { expect { should_not allow("").as(:category) }.to fail_assertion }
    end

    context "with several attributes" do
      it { should allow("Elabs").as(:title, :body) }
      it { should_not allow("").as(:title, :body) }

      it { expect { should allow("").as(:title, :body) }.to fail_assertion }
      it { expect { should_not allow("Elabs").as(:title, :body) }.to fail_assertion }

      it { expect { should allow("").as(:title, :category) }.to fail_assertion }
      it { expect { should_not allow("").as(:title, :category) }.to fail_assertion }
    end
  end

  context "with several example values" do
    context "with one attribute" do
      it { should allow("Elabs", "Sweden").as(:title) }
      it { should_not allow("", nil).as(:title) }

      it { expect { should allow("Elabs", "").as(:title) }.to fail_assertion }
      it { expect { should_not allow("", "Elabs").as(:title) }.to fail_assertion }
      it { expect { should_not allow("", "Elabs").as(:category) }.to fail_assertion }
    end

    context "with several attributes" do
      it { should allow("Elabs", "Sweden").as(:title, :body) }
      it { should_not allow("", nil).as(:title, :body) }

      it { expect { should allow("Elabs", "").as(:title, :body) }.to fail_assertion }
      it { expect { should_not allow("", "Elabs").as(:title, :body) }.to fail_assertion }

      it { expect { should allow("", "Elabs").as(:title, :category) }.to fail_assertion }
      it { expect { should_not allow("", "Elabs").as(:title, :category) }.to fail_assertion }
    end
  end
end