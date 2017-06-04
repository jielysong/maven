package com.yx.app.admin.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;


public class DlFileEntry implements Serializable {
	
	private String uuid_;
	private Long fileEntryId;
	private Integer groupId;
	private Integer companyId;
	private Long userId;
	private String userName;
	private String versionUserId;
	private String versionUserName;
	private Timestamp  createDate;
	private Timestamp  modifiedDate;
	private Integer repositoryId;
	private Integer folderId;
	private String name;
	private String extension;
	private String mimeType;
	private String title;
	private String description;
	private String extraSettings;
	private Integer fileEntryTypeId;
	private String version;
	private Long size_;
	private Integer readCount;
	private Long smallImageId;
	private Integer largeImageId;
	private Integer custom1ImageId;
	private Integer custom2ImageId;
	private String appDownloadUrl;
	public String getUuid_() {
		return uuid_;
	}
	public void setUuid_(String uuid_) {
		this.uuid_ = uuid_;
	}
	 
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getVersionUserId() {
		return versionUserId;
	}
	public void setVersionUserId(String versionUserId) {
		this.versionUserId = versionUserId;
	}
	public String getVersionUserName() {
		return versionUserName;
	}
	public void setVersionUserName(String versionUserName) {
		this.versionUserName = versionUserName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public Date getModifiedDate() {
		return modifiedDate;
	}
 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getMimeType() {
		return mimeType;
	}
	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getExtraSettings() {
		return extraSettings;
	}
	public void setExtraSettings(String extraSettings) {
		this.extraSettings = extraSettings;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}

	public String getAppDownloadUrl() {
		return appDownloadUrl;
	}
	public void setAppDownloadUrl(String appDownloadUrl) {
		this.appDownloadUrl = appDownloadUrl;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public void setModifiedDate(Timestamp modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Integer getRepositoryId() {
		return repositoryId;
	}
	public void setRepositoryId(Integer repositoryId) {
		this.repositoryId = repositoryId;
	}
	public Integer getFolderId() {
		return folderId;
	}
	public void setFolderId(Integer folderId) {
		this.folderId = folderId;
	}
	public Integer getFileEntryTypeId() {
		return fileEntryTypeId;
	}
	public void setFileEntryTypeId(Integer fileEntryTypeId) {
		this.fileEntryTypeId = fileEntryTypeId;
	}
	public Integer getReadCount() {
		return readCount;
	}
	public void setReadCount(Integer readCount) {
		this.readCount = readCount;
	}
	public Integer getLargeImageId() {
		return largeImageId;
	}
	public void setLargeImageId(Integer largeImageId) {
		this.largeImageId = largeImageId;
	}
	public Integer getCustom1ImageId() {
		return custom1ImageId;
	}
	public void setCustom1ImageId(Integer custom1ImageId) {
		this.custom1ImageId = custom1ImageId;
	}
	public Integer getCustom2ImageId() {
		return custom2ImageId;
	}
	public void setCustom2ImageId(Integer custom2ImageId) {
		this.custom2ImageId = custom2ImageId;
	}
	public Long getFileEntryId() {
		return fileEntryId;
	}
	public void setFileEntryId(Long fileEntryId) {
		this.fileEntryId = fileEntryId;
	}
	public Long getSmallImageId() {
		return smallImageId;
	}
	public void setSmallImageId(Long smallImageId) {
		this.smallImageId = smallImageId;
	}
	public Long getSize_() {
		return size_;
	}
	public void setSize_(Long size_) {
		this.size_ = size_;
	}
 
}
