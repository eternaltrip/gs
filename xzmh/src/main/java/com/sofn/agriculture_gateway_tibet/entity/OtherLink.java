package com.sofn.agriculture_gateway_tibet.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 友情链接
 * @author Administrator
 *
 */
public class OtherLink implements Serializable {
	private String lid;

	private String linkname;

	private Short linksort;

	private Short linkstate;//0：未启用，1：启用

	private Date createtime;

	private Date updatetime;

	private String linkaddr;

	private static final long serialVersionUID = 1L;

	public String getLid() {
		return lid;
	}

	public void setLid(String lid) {
		this.lid = lid == null ? null : lid.trim();
	}

	public String getLinkname() {
		return linkname;
	}

	public void setLinkname(String linkname) {
		this.linkname = linkname == null ? null : linkname.trim();
	}

	public Short getLinksort() {
		return linksort;
	}

	public void setLinksort(Short linksort) {
		this.linksort = linksort;
	}

	public Short getLinkstate() {
		return linkstate;
	}

	public void setLinkstate(Short linkstate) {
		this.linkstate = linkstate;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public String getLinkaddr() {
		return linkaddr;
	}

	public void setLinkaddr(String linkaddr) {
		this.linkaddr = linkaddr == null ? null : linkaddr.trim();
	}

	@Override
	public boolean equals(Object that) {
		if (this == that) {
			return true;
		}
		if (that == null) {
			return false;
		}
		if (getClass() != that.getClass()) {
			return false;
		}
		OtherLink other = (OtherLink) that;
		return (this.getLid() == null ? other.getLid() == null : this.getLid().equals(other.getLid()))
				&& (this.getLinkname() == null ? other.getLinkname() == null
						: this.getLinkname().equals(other.getLinkname()))
				&& (this.getLinksort() == null ? other.getLinksort() == null
						: this.getLinksort().equals(other.getLinksort()))
				&& (this.getLinkstate() == null ? other.getLinkstate() == null
						: this.getLinkstate().equals(other.getLinkstate()))
				&& (this.getCreatetime() == null ? other.getCreatetime() == null
						: this.getCreatetime().equals(other.getCreatetime()))
				&& (this.getUpdatetime() == null ? other.getUpdatetime() == null
						: this.getUpdatetime().equals(other.getUpdatetime()))
				&& (this.getLinkaddr() == null ? other.getLinkaddr() == null
						: this.getLinkaddr().equals(other.getLinkaddr()));
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((getLid() == null) ? 0 : getLid().hashCode());
		result = prime * result + ((getLinkname() == null) ? 0 : getLinkname().hashCode());
		result = prime * result + ((getLinksort() == null) ? 0 : getLinksort().hashCode());
		result = prime * result + ((getLinkstate() == null) ? 0 : getLinkstate().hashCode());
		result = prime * result + ((getCreatetime() == null) ? 0 : getCreatetime().hashCode());
		result = prime * result + ((getUpdatetime() == null) ? 0 : getUpdatetime().hashCode());
		result = prime * result + ((getLinkaddr() == null) ? 0 : getLinkaddr().hashCode());
		return result;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", lid=").append(lid);
		sb.append(", linkname=").append(linkname);
		sb.append(", linksort=").append(linksort);
		sb.append(", linkstate=").append(linkstate);
		sb.append(", createtime=").append(createtime);
		sb.append(", updatetime=").append(updatetime);
		sb.append(", linkaddr=").append(linkaddr);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}
}