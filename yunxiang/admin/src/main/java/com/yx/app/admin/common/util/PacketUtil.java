package com.yx.app.admin.common.util;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class PacketUtil {
	/**
	 * 拼手气抢红包
	 * 
	 * @author JIANGGERONG
	 * @param balance
	 *            总金额
	 * @param count
	 *            个数
	 * @param min
	 *            红包最小值
	 */
	public static List<Double> fightLuck(double balance, int count, double min) {
		List<Double> l = new ArrayList<Double>();
		for (int i = 1; i < count; i++) {
			double safe_total = (balance - (count - i) * min) / (count - i);
			double money = Math.random() * (safe_total - min) + min;
			BigDecimal money_bd = new BigDecimal(money);
			money = money_bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			balance = balance - money;
			BigDecimal total_bd = new BigDecimal(balance);
			balance = total_bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			l.add(money);
			// System.out.println("第" + i + "个红包：" + money + ",余额为:" + total +
			// "元");
		}
		l.add(balance);
		// System.out.println("第" + num + "个红包：" + total + ",余额为:0元");
		return l;
	}

}
