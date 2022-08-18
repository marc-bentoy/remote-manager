require "test_helper"

class MachineStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @machine_stat = machine_stats(:one)
  end

  test "should get index" do
    get machine_stats_url, as: :json
    assert_response :success
  end

  test "should create machine_stat" do
    assert_difference("MachineStat.count") do
      post machine_stats_url, params: { machine_stat: { active_wifi_users: @machine_stat.active_wifi_users, currency: @machine_stat.currency, machine_id: @machine_stat.machine_id, sales: @machine_stat.sales } }, as: :json
    end

    assert_response :created
  end

  test "should show machine_stat" do
    get machine_stat_url(@machine_stat), as: :json
    assert_response :success
  end

  test "should update machine_stat" do
    patch machine_stat_url(@machine_stat), params: { machine_stat: { active_wifi_users: @machine_stat.active_wifi_users, currency: @machine_stat.currency, machine_id: @machine_stat.machine_id, sales: @machine_stat.sales } }, as: :json
    assert_response :success
  end

  test "should destroy machine_stat" do
    assert_difference("MachineStat.count", -1) do
      delete machine_stat_url(@machine_stat), as: :json
    end

    assert_response :no_content
  end
end
