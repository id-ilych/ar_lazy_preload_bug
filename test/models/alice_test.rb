require "test_helper"

class AliceTest < ActiveSupport::TestCase
  test "the truth" do
    alice = Alice.create(alice: 1)
    bob = Bob.create(bob: 2, alice:)
    charlie = Charlie.create(charlie: 3, bob:)

    record = Alice.preload_associations_lazily.find(alice.id)
    assert record.lazy_preload_context.present?, "lazy context is missing for alice"
    assert_equal loaded_associations(record), [], "some associations are preloaded"
    assert_equal record.charlie.charlie, 3, "unexpected charlie value"
    assert_equal loaded_associations(record), %w[bob charlie], "unexpected associations preloaded"
    assert record.charlie.lazy_preload_context.present?, "lazy context is missing for charlie"
    assert record.bob.lazy_preload_context.present?, "lazy context is missing for bob"
  end

  def loaded_associations(record)
    record.class.reflections.keys.filter do |name|
      record.association(name.to_sym).loaded?
    end.sort
  end
end
